# in my case host_os can be either:
# windows OR
# linux-mac
# the file names must be of the form command = templatefile("${var.host_os}-ssh-script.tpl", {
variable "host_os" {
    type = string
}