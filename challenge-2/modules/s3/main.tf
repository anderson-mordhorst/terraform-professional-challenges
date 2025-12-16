variable "s3_buckets" {
  type = set(string)
}

variable "s3_base_object" {
  type = string
}

variable "bucket_prefix" {
  type = string
}


resource "aws_s3_bucket" "example" {
  for_each = var.s3_buckets
  bucket   = "${var.bucket_prefix}-${each.value}"
}

resource "aws_s3_object" "object" {
  for_each = var.s3_buckets
  bucket   = aws_s3_bucket.example[each.key].id
  key      = var.s3_base_object
}
