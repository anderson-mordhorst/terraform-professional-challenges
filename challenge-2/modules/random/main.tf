resource "random_pet" "this" {}

output "name" {
  value = random_pet.this.id
}