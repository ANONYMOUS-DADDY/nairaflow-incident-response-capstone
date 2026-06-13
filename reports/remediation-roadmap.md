# Security Remediation Roadmap – NairaFlow Technologies

## Objective

Eliminate root causes of the breach and transition the organization to a Zero Trust, PCI-DSS compliant cloud security posture.

---

## Phase 1: Immediate Actions (0–30 Days)

### Identity Security

* Rotate all AWS IAM credentials
* Enforce MFA for all privileged accounts
* Disable all long-lived access keys
* Implement emergency IAM access review

### Incident Containment

* Maintain quarantine SCP policies
* Block known malicious IP ranges
* Revoke all active sessions via Okta
* Rotate all HashiCorp Vault secrets

---

## Phase 2: Short-Term Hardening (30–90 Days)

### IAM Governance

* Implement strict least privilege policies
* Introduce IAM Access Analyzer reviews
* Remove wildcard permissions (*)
* Enforce role-based access control (RBAC)

### Network Security

* Implement strict VPC segmentation
* Isolate staging and production environments
* Deploy AWS Security Groups with deny-by-default rules

### Kubernetes Security

* Enforce NetworkPolicies using Calico/Cilium
* Restrict pod-to-pod communication
* Enable cluster-wide audit logging

---

## Phase 3: Long-Term Transformation (90–180 Days)

### Zero Trust Architecture

* Move to identity-based access controls
* Enforce continuous authentication via Okta
* Implement device trust policies

### Secrets Management

* Transition fully to short-lived credentials
* Expand HashiCorp Vault dynamic secrets usage
* Eliminate static credentials entirely

### Monitoring & Detection

* Enhance Splunk correlation rules
* Implement behavioral anomaly detection
* Conduct quarterly red team exercises

---

## Compliance Alignment

* PCI-DSS v4.0: Achieve full compliance readiness
* ISO 27001: Establish ISMS controls
* SOC 2 alignment for audit readiness

---

## Expected Outcomes

* 75% reduction in IAM attack surface
* Zero trust network enforcement
* Fully segmented production environment
* Continuous monitoring and automated alerting
* Improved MTTC and MTTR metrics
