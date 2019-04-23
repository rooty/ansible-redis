workflow "New workflow" {
  on = "push"
  resolves = ["GitHub Action for Slack"]
}

action "Docker Registry" {
  uses = "actions/docker/login@8cdf801b322af5f369e00d85e9cf3a7122f49108"
  secrets = ["GITHUB_TOKEN"]
}

action "GitHub Action for Slack" {
  uses = "Ilshidur/action-slack@2a8ddb6db23f71a413f9958ae75bbc32bbaa6385"
  needs = ["Docker Registry"]
  secrets = ["GITHUB_TOKEN"]
}
