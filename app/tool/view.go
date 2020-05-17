package tool

import (
	"github.com/kyour-cn/gourd/server/view"
	"go-mdblog/app/model"
)

func ComViewData(v *view.Template) {

	//站点信息
	v.Assign("site", (model.Setting{}).GetSite())

	//栏目信息
	v.Assign("column", (model.Column{}).GetAll())

	//获取每日一句
	ds := ApiGetDaysent()
	v.Assign("ds", ds)

}
