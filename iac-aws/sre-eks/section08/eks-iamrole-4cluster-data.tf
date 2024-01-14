
data "aws_iam_policy_document" "eks_master_role_document" {
  source_policy_documents = [file("${path.module}/eks-iamrole-stsAssumeRole.json")]
}