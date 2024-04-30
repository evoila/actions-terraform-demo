resource "nsxt_policy_segment" "tf-actions-segment" {
  display_name        = "segment01-test"
  description         = "Terraform provisioned Segment via Github Actions"
  transport_zone_path = data.nsxt_policy_transport_zone.tz1.path
}