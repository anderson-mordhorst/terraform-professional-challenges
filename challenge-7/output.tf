output "list_amis" {
  value = [for item in local.data : item.AMI_ID]
}

output "unique_team_names" {
  value = toset([for item in local.data : item.Team_Name])
}

output "regions_list_of_lists" {
  value = [for item in local.data : [item.Region]]
}

output "list_list_condition" {
  value = [for item in local.data : [item.Region] if item.instance_type == "nano"]
}

output "instance_count_by_type" {
  value = { for key, value in { for value in local.data : value.instance_type => value... } : key => length(value) }
}

/*
output "instance_count_by_type_another_way" {
  value = { for item in local.instance_type : item => length([for value in local.data : value if value.instance_type == item]) }
}
*/

output "instance_details" {
  value = [for item in local.data : {
    team = item.Team_Name
    type = item.instance_type
  }]
}

output "map_of_maps" {
  value = { for item in local.data : "${item.instance_type}_${item.Region}_${item.Team_Name}" => {
    ami_id        = item.AMI_ID
    instance_type = item.instance_type
    region        = item.Region
    team_name     = item.Team_Name
  } }
}