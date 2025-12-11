# Root module just aggregates other .tf files in this folder.

terraform {
  # 可选：根据需要配置 remote backend，例如 S3。
}

# 这里什么都不用写，providers.tf / network_alb_asg.tf / cicd.tf 会一起生效。
