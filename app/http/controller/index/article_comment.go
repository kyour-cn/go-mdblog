package index

import (
	"github.com/kyour-cn/gourd/server/db"
	"github.com/kyour-cn/gourd/server/router"
	"github.com/kyour-cn/gourd/server/session"
	"github.com/kyour-cn/gourd/utils/gut"
	"go-mdblog/app/model"
	"net/http"
)

//文章评论
func articleComment(w http.ResponseWriter, r *http.Request) {

	//将session.user赋值到模板
	s := session.GetSession(w, r)
	user := s.Get("user").(model.User)

	//如果未登录
	if user.Uid == 0 {
		ret := map[string]interface{}{
			"status":  0,
			"message": "请先登录",
		}

		gut.Rjosn(w, ret)
	}
	params := router.Vars(r)

	//创建数据
	comment := model.ArticleComment{
		Time:    uint(gut.Time()),
		Aid:     gut.Str2uint(params["id"]),
		Uid:     user.Uid,
		Content: r.FormValue("content"),
	}

	conn := db.Conn()

	_ = conn.Create(&comment)

	ret := map[string]interface{}{
		"status":  1,
		"message": "评论发布成功",
	}

	gut.Rjosn(w, ret)

}
