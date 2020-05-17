package controller

/**
 * This file is part of Gourd.
 *
 * @link     http://gourd.kyour.cn
 * @document http://gourd.kyour.cn/doc
 * @contact  kyour@vip.qq.com
 * @license  https://https://github.com/kyour-cn/gourd/blob/master/LICENSE
 */

import (
	"github.com/kyour-cn/gourd/server/router"
	"go-mdblog/app/http/controller/admin"
	"go-mdblog/app/http/controller/index"
	"go-mdblog/app/http/controller/manage"
	"go-mdblog/app/http/controller/user"
)

//注册控制器
func Register(route *router.Router) *router.Router {

	//index控制器路由
	index.Register(route)

	//user控制器路由
	user.Register(route)

	//manage控制器路由
	manage.Register(route)

	//admin控制器路由
	admin.Register(route)

	return route
}
