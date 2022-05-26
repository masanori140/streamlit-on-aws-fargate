# --------------------------------------------------------------------------------
# 属性定義
# ../../terrgrunt.hcl inputsブロックで定義した属性
# --------------------------------------------------------------------------------

variable "account" {
  type = map(string)
}

variable "region" {
  type = map(string)
}

variable "tags" {
  type = map(string)
}
