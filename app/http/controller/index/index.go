package index

/**
 * This file is part of Gourd.
 *
 * @link     http://gourd.kyour.cn
 * @document http://gourd.kyour.cn/doc
 * @contact  kyour@vip.qq.com
 * @license  https://https://github.com/kyour-cn/gourd/blob/master/LICENSE
 */

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

const prefix = "/index"

//注册路由
func Register(r *router.Router) {

	//这里注册一个默认首页,不注册会访问静态资源
	r.HandleFunc("/", index)
	r.HandleFunc("/-page-{page}", index)

	//文章地址
	r.HandleFunc("/article/{id}", article)
	//文章评论
	r.HandleFunc("/article/{id}/comment", articleComment)

	//文章分类
	r.HandleFunc("/-class", classPage)
	r.HandleFunc("/-class/{id}", classPage)
	r.HandleFunc("/-class/{id}/{page}", classPage)

	//标签云
	r.HandleFunc("/-tags", tagPage)

	//读者墙
	r.HandleFunc("/-readers", readersPage)

	//友情链接
	r.HandleFunc("/-links", linksPage)

}

//主页地址 /
func index(w http.ResponseWriter, r *http.Request) {

	v := view.New("temp/layout")
	v.AddFile("index")

	//公用数据赋值
	tool.ComViewData(&v)

	//将session.user赋值到模板
	s := session.GetSession(w, r)
	v.Assign("user", s.Get("user"))

	//获取数据库连接
	conn := db.Conn()

	//分页页数
	page := gut.Str2int(router.Vars(r)["page"])

	//查询文章总数
	var count int64
	conn.Model(&model.Article{}).Count(&count)
	pagin := gut.Paginator(page, 10, count)
	v.Assign("article_count", pagin)

	//查询文章列表
	var list []model.Article
	conn.
		Limit(10).
		Offset((pagin["currpage"].(int) - 1) * 10).
		Order("addtime desc").
		Find(&list)
	v.Assign("article_list", &list)

	_ = v.Fetch(w)

}

//文章查看页
func article(w http.ResponseWriter, r *http.Request) {

	v := view.New("temp/layout")
	//添加模板文件
	v.AddFile("article")

	//公用数据赋值
	tool.ComViewData(&v)

	//将session.user赋值到模板
	s := session.GetSession(w, r)
	v.Assign("user", s.Get("user"))

	conn := db.Conn()

	//取得url变量
	param := router.Vars(r)

	//文章Id
	id := gut.Str2uint(param["id"])

	//获取文章数据
	article := (&model.ArticleAll{}).GetContent(id)
	if article.Id == 0 {
		w.Header().Set("Location", "/error/404")
		w.WriteHeader(302)
		return
	}
	v.Assign("article", &article)
	v.Assign("pagename", article.Title)
	//conn.LogMode(true)
	//查询评论数据
	comments := []model.ArticleComment{}
	conn.
		Where("aid = ?", article.Id).
		Preload("User").
		Find(&comments)
	v.Assign("comments", comments)

	//自增Pv
	article.PvAdd(id)

	//样式设定
	v.Assign("style_body", "single")

	_ = v.Fetch(w)

}

//文章分类 /-class/{id}/{page}
func classPage(w http.ResponseWriter, r *http.Request) {

	v := view.New("temp/layout-wide")
	//添加模板文件
	v.AddFile("class")

	//查出所有分类
	class := []model.ArticleClass{}
	db.Conn().Find(&class)
	v.Assign("class", class)

	//公用数据赋值
	tool.ComViewData(&v)

	//将session.user赋值到模板
	s := session.GetSession(w, r)
	v.Assign("user", s.Get("user"))

	//获取数据库连接
	conn := db.Conn()

	//分页页数 & 分类Id
	params := router.Vars(r)
	page := gut.Str2int(params["page"])
	classId := gut.Str2uint(params["id"])

	if classId == 0 {
		classId = uint(class[0].Id)
	}
	v.Assign("classId", &classId)

	//查询文章总数
	var count int64
	conn.Model(&model.Article{}).
		Where("class = ?", classId).
		Count(&count)
	pagin := gut.Paginator(page, 10, count)
	v.Assign("article_count", pagin)

	//查询文章列表
	var list []model.Article
	conn.
		Where("class = ?", classId).
		Limit(10).
		Offset((pagin["currpage"].(int) - 1) * 10).
		Order("addtime desc").
		Find(&list)
	v.Assign("article_list", &list)

	_ = v.Fetch(w)

}

//标签页
func tagPage(w http.ResponseWriter, r *http.Request) {

	v := view.New("temp/layout-wide")
	//添加模板文件
	v.AddFile("tags")

	//公用数据赋值
	tool.ComViewData(&v)

	//将session.user赋值到模板
	s := session.GetSession(w, r)
	v.Assign("user", s.Get("user"))

	_ = v.Fetch(w)

}

//读者墙
func readersPage(w http.ResponseWriter, r *http.Request) {

	v := view.New("temp/layout-wide")
	//添加模板文件
	v.AddFile("readers")

	//公用数据赋值
	tool.ComViewData(&v)

	//将session.user赋值到模板
	s := session.GetSession(w, r)
	v.Assign("user", s.Get("user"))

	_ = v.Fetch(w)

}

//友情链接
func linksPage(w http.ResponseWriter, r *http.Request) {

	v := view.New("temp/layout-wide")
	//添加模板文件
	v.AddFile("links")

	//公用数据赋值
	tool.ComViewData(&v)

	//将session.user赋值到模板
	s := session.GetSession(w, r)
	v.Assign("user", s.Get("user"))

	_ = v.Fetch(w)

}
