package manage

import (
	"github.com/kyour-cn/gourd/server/db"
	"github.com/kyour-cn/gourd/server/router"
	"github.com/kyour-cn/gourd/server/session"
	"github.com/kyour-cn/gourd/server/view"
	"github.com/kyour-cn/gourd/utils/gut"
	"go-mdblog/app/model"
	"go-mdblog/app/tool"
	"net/http"
)

const prefix = "/manage"

//注册路由
func Register(r *router.Router) {

	//获取子路由
	sr := r.PathPrefix(prefix).Subrouter()

	//编辑我的文章
	sr.HandleFunc("/addArticle", addArticle)

	//编辑我的文章
	sr.PathPrefix("/editArticle/{id}").HandlerFunc(editArticle)

	//删除我的文章
	sr.HandleFunc("/delArticle/{id}", delArticle)

	//这里注册一个默认首页,不注册会访问静态资源
	//r.HandleFunc("/", index)

}

//文章查看页 /manage/editArticle
func editArticle(w http.ResponseWriter, r *http.Request) {

	//获取session
	s := session.GetSession(w, r)

	if u := s.Get("user"); u == nil {
		w.Header().Set("Location", "/")
		w.WriteHeader(302)
		return
	}
	user := s.Get("user").(model.User)

	//取得url变量
	param := router.Vars(r)

	//文章Id
	id := gut.Str2uint(param["id"])

	//获取文章数据
	article := (&model.ArticleAll{}).GetContent(id)

	//验证是否不是作者
	if user.Uid != article.Uid {
		w.Header().Set("Location", "/")
		w.WriteHeader(302)
		return
	}

	//如果是POST请求
	if r.Method == "POST" {

		_ = r.ParseForm()

		//json, _ := gut.JsonEn(r.PostForm)
		//w.Write([]byte(json))

		//ss:=r.PostForm["dsd"]

		field := []string{
			"title",
			"cover",
			"introduce",
			"content",
		}

		data := map[string]interface{}{}

		for _, v := range field {

			data[v] = r.FormValue(v)

		}

		data["edittime"] = gut.Time()

		data["class"] = gut.Str2uint(r.FormValue("class"))

		article.Update(data)

		ret := map[string]interface{}{
			"status":  1,
			"message": "更新成功",
		}

		gut.Rjosn(w, ret)

	} else {

		v := view.New("temp/layout-wide")
		//添加模板文件
		v.AddFile("manage/edit_article")

		v.Assign("pagename", "文章编辑")

		//公用数据赋值
		tool.ComViewData(&v)

		//将session.user赋值到模板
		v.Assign("user", user)

		v.Assign("article", &article)

		//查出所有分类
		class := []model.ArticleClass{}
		db.Conn().Find(&class)
		v.Assign("class", class)

		//样式设定
		v.Assign("style_body", "single")

		_ = v.Fetch(w)
	}

}

//文章查看页 /manage/addArticle
func addArticle(w http.ResponseWriter, r *http.Request) {

	//获取session
	s := session.GetSession(w, r)

	if u := s.Get("user"); u == nil {
		w.Header().Set("Location", "/")
		w.WriteHeader(302)
		return
	}
	user := s.Get("user").(model.User)

	//如果是POST请求
	if r.Method == "POST" {

		_ = r.ParseForm()

		//json, _ := gut.JsonEn(r.PostForm)
		//w.Write([]byte(json))

		//ss:=r.PostForm["dsd"]

		//创建文章
		conn := db.Conn()

		article := model.Article{
			Uid:       user.Uid,
			Class:     gut.Str2uint(r.FormValue("class")),
			Title:     r.FormValue("title"),
			Introduce: r.FormValue("introduce"),
			Cover:     r.FormValue("cover"),
			Addtime:   uint(gut.Time()),
			Edittime:  uint(gut.Time()),
			//Class
		}

		//a_all := model.ArticleAll{
		//	article,
		//	"dsd",
		//}

		_ = conn.Create(&article)

		ret := map[string]interface{}{
			"status":  1,
			"message": "发布成功",
			"id":      article.Id,
		}

		gut.Rjosn(w, ret)

	} else {

		v := view.New("temp/layout-wide")
		//添加模板文件
		v.AddFile("manage/add_article")

		v.Assign("pagename", "新增文章")

		//公用数据赋值
		tool.ComViewData(&v)

		v.Assign("article", &model.ArticleAll{})

		//将session.user赋值到模板
		v.Assign("user", user)

		//查出所有分类
		class := []model.ArticleClass{}
		db.Conn().Find(&class)
		v.Assign("class", class)

		//样式设定
		v.Assign("style_body", "single")

		_ = v.Fetch(w)
	}

}

//删除文章 /manage/delArticle
func delArticle(w http.ResponseWriter, r *http.Request) {

	//获取session
	s := session.GetSession(w, r)

	if u := s.Get("user"); u == nil {
		w.Header().Set("Location", "/")
		w.WriteHeader(302)
		return
	}
	user := s.Get("user").(model.User)

	//取得url变量
	param := router.Vars(r)

	//文章Id
	id := gut.Str2uint(param["id"])

	//获取文章数据
	article := (&model.ArticleAll{}).GetContent(id)

	//验证是否不是作者
	if user.Uid != article.Uid {
		w.Header().Set("Location", "/")
		w.WriteHeader(302)
		return
	}

	db.Conn().Delete(&article)

	_, _ = w.Write([]byte("<script>alert('删除成功！');window.location.href=\"/\";</script>"))

}
