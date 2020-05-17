package admin

import (
	"github.com/kyour-cn/gourd/server/router"
	"github.com/kyour-cn/gourd/server/session"
	"github.com/kyour-cn/gourd/server/view"
	"go-mdblog/app/model"
	"go-mdblog/app/tool"
	"net/http"
)

const prefix = "/admin"

//注册路由
func Register(r *router.Router) {

	//获取子路由
	sr := r.PathPrefix(prefix).Subrouter()

	//编辑我的文章
	sr.HandleFunc("/main", mainPage)
	//分类管理
	sr.HandleFunc("/class", class)

	//这里注册一个默认首页,不注册会访问静态资源
	sr.HandleFunc("", index)

}

//后台页
func index(w http.ResponseWriter, r *http.Request) {

	v := view.New("temp/layout-admin")
	v.AddFile("admin/index")

	//公用数据赋值
	tool.ComViewData(&v)

	v.Assign("pagename", "后台管理")

	//获取session
	s := session.GetSession(w, r)

	//获取user数据
	var user model.User
	if u := s.Get("user"); u != nil {
		user = u.(model.User)
	}
	v.Assign("user", user)
	if !user.Admin {
		w.Header().Set("Location", "/")
		w.WriteHeader(302)
		return
	}

	_ = v.Fetch(w)
}

//后台首页
func mainPage(w http.ResponseWriter, r *http.Request) {

	v := view.New("temp/layout-admin")
	v.AddFile("admin/main")

	//公用数据赋值
	tool.ComViewData(&v)

	v.Assign("pagename", "后台")

	//获取session
	s := session.GetSession(w, r)

	//获取user数据
	var user model.User
	if u := s.Get("user"); u != nil {
		user = u.(model.User)
	}
	v.Assign("user", user)

	_ = v.Fetch(w)
}

//分类管理
func class(w http.ResponseWriter, r *http.Request) {
	v := view.New("temp/layout-admin")
	v.AddFile("admin/manage_class")

	//公用数据赋值
	tool.ComViewData(&v)

	//获取session
	s := session.GetSession(w, r)

	//获取user数据
	var user model.User
	if u := s.Get("user"); u != nil {
		user = u.(model.User)
	}
	v.Assign("user", user)

	_ = v.Fetch(w)
}
