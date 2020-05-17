package model

import "github.com/kyour-cn/gourd/server/db"

type User struct {
	Uid    uint   `gorm:"type:int(11);primary_key"`
	Uname  string `gorm:"index:uname;UNIQUE"` // 给address字段创建名为addr的索引
	Emali  string `gorm:"type:varchar(255);"`
	Qq     string
	Pwd    string `gorm:"type:varchar(32);"`
	Avatar string `gorm:"type:varchar(500);"`
	Type   uint
	Admin  bool
}

//定义数据库表名
func (User) TableName() string {
	return "user"
}

//刷新当前user对象数据
func (u *User) Refresh() {

	db.Conn().
		Where("uid = ?", u.Uid).
		Find(&u)

}

//User的Session结构体
type UserSess struct {
	User
	LoginTime uint
}
