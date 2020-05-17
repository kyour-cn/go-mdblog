package user

import (
	"fmt"
	"github.com/kyour-cn/gourd/server/db"
	"github.com/kyour-cn/gourd/server/router"
	"github.com/kyour-cn/gourd/server/session"
	"github.com/kyour-cn/gourd/server/view"
	"github.com/kyour-cn/gourd/utils/gut"
	"go-mdblog/app/model"
	"go-mdblog/app/tool"
	"net/http"
)

const prefix = "/user"

//注册路由
func Register(r *router.Router) {

	//获取子路由
	sr := r.PathPrefix(prefix).Subrouter()

	sr.PathPrefix("/login").HandlerFunc(login)
	sr.PathPrefix("/regist").HandlerFunc(regist)
	sr.PathPrefix("/logout").HandlerFunc(logout)

	//默认首页，必须放在最后
	sr.PathPrefix("").HandlerFunc(index)

}

//主页 /user
func index(w http.ResponseWriter, r *http.Request) {

	v := view.New("temp/layout-wide")
	v.AddFile("user/index")

	//公用数据赋值
	tool.ComViewData(&v)

	v.Assign("pagename", "会员中心")

	//获取session
	s := session.GetSession(w, r)

	if u := s.Get("user"); u == nil {
		w.Header().Set("Location", "/")
		w.WriteHeader(302)
		return
	}

	//获取user数据
	var user model.User
	if u := s.Get("user"); u != nil {
		user = u.(model.User)
	}
	v.Assign("user", user)

	_ = v.Fetch(w)

}

//用户登录 /user/login
func login(w http.ResponseWriter, r *http.Request) {

	s := session.GetSession(w, r)

	//如果是POST请求
	if r.Method == "POST" {

		conn := db.Conn()

		uname := r.FormValue("username")
		pwd := r.FormValue("password")

		user := model.User{}

		conn.Where("uname = ?", uname).
			Where("pwd = ?", gut.Md5(pwd)).
			Find(&user)

		//去除密码
		user.Pwd = ""

		if user.Uid != 0 {
			_, _ = w.Write([]byte("<script>alert('登录成功！');window.history.back();</script>"))

			//保存session
			//sess, _ := gut.JsonEn(user)
			_ = s.Set("user", user)

		} else {
			_, _ = w.Write([]byte("<script>alert('用户名不存在或密码错误！');window.location.href=\"/\";</script>"))

		}

		//验证用户

	} else {

		s := session.GetSession(w, r)
		_, _ = fmt.Fprint(w, "sessionId:", s.Get("user"))
	}

}

//注销登录 /user/logout
func logout(w http.ResponseWriter, r *http.Request) {

	s := session.GetSession(w, r)
	_ = s.Clear()

	w.Header().Set("Location", "/")
	w.WriteHeader(302)
	return

}

//用户注册 /user/regist
func regist(w http.ResponseWriter, r *http.Request) {

	//如果是POST请求
	if r.Method == "POST" {

		conn := db.Conn()

		var uname string = r.FormValue("uname")
		var pwd string = r.FormValue("pass")

		var msg string

		if len(pwd) < 6 {
			msg = "密码长度不能小于6"

		}
		if len(uname) < 5 || len(uname) > 12 {
			msg = "用户名长度只能为5-12"
		}

		if len(r.FormValue("qq")) < 5 {
			msg = "请填写正确的qq号"
		}

		if msg != "" {
			_, _ = w.Write([]byte("<script>alert('" + msg + "！');window.history.back();</script>"))
			return
		}

		user := model.User{
			Uname:  r.FormValue("uname"),
			Emali:  r.FormValue("email"),
			Qq:     r.FormValue("qq"),
			Pwd:    gut.Md5(r.FormValue("pass")),
			Avatar: "http://q1.qlogo.cn/g?b=qq&nk=" + r.FormValue("qq") + "&s=100&t=",
		}

		_ = conn.Create(&user)

		_, _ = w.Write([]byte("<script>alert('注册成功，请重新登录！');window.location.href=\"/\";</script>"))

		return

	}

	v := view.New("user/regist")

	//站点信息
	v.Assign("site", (model.Setting{}).GetSite())

	_ = v.Fetch(w)

}
