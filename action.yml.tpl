name: 'Terragrunt GitHub Actions'
description: 'Runs Terragrunt commands via GitHub Actions.'
author:  'HashiCorp, Inc. Terraform Team <terraform@hashicorp.com>'
branding:
  icon: 'cloud'
  color: 'purple'
inputs:
  tf_actions_subcommand:
    description: 'Terraform or Terragrunt subcommand to execute.'
    required: true
  tf_actions_binary:
    description: 'Binary to use. Terraform or Terragrunt'
    default: 'terragrunt'
  tf_actions_version:
    description: 'Terraform version to install.'
    required: true
    default: 'latest'
  tg_actions_version:
    description: 'Terragrunt version to install.'
    required: true
    default: 'latest'
  tf_actions_cli_credentials_hostname:
    description: 'Hostname for the CLI credentials file.'
    default: 'app.terraform.io'
  tf_actions_cli_credentials_token:
    description: 'Token for the CLI credentials file.'
  tf_actions_comment:
    description: 'Whether or not to comment on pull requests.'
    default: true
  tf_actions_working_dir:
    description: 'Terragrunt working directory.'
    default: '.'
  tf_actions_fmt_write:
    description: 'Write Terragrunt fmt changes to source files.'
    default: false
  tf_actions_pre_commands:
    description: >
      An arbitrary series of commands to execute before running the specified command.
      This can be used to customize the Docker execution environment. If any of these commands
      need to set environment variables required at the time `terragrunt` is executed, you must
      add them to the file at the path defined by the `ENV_VAR_FILE` environment variable as a
      key/value pair, like this:

      ```
      echo "FOO=bar" >> ${ENV_VAR_FILE}
      ```
    default: ''
    required: false
outputs:
  tf_actions_output:
    description: 'The Terragrunt outputs in JSON format.'
  tf_actions_plan_has_changes:
    description: 'Whether or not the Terragrunt plan contained changes.'
  tf_actions_plan_output:
    description: 'The Terragrunt plan output.'
  tf_actions_fmt_written:
    description: 'Whether or not the Terragrunt formatting was written to source files.'
runs:
  using: 'docker'
  image: 'docker://ghcr.io/{{ getenv "GITHUB_OWNER" }}/terragrunt-github-actions:{{ getenv "GIT_TAG" }}'
