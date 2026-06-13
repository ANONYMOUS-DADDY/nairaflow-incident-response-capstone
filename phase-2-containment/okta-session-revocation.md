# Okta Incident Containment Procedure

## Objective

Terminate all active sessions linked to compromised identity provider authentication events.

---

## Actions Taken

### 1. Session Invalidation

* All active tokens revoked
* SSO sessions terminated
* Refresh tokens invalidated

### 2. MFA Reset

* Forced MFA re-enrollment
* Disabled legacy authentication methods

### 3. Risk-Based Blocking

* Flagged login attempts from:

  * Eastern Europe IP ranges
  * Unknown devices
  * Untrusted geolocations

---

## Security Impact

* Eliminates attacker persistence via identity layer
* Forces re-authentication under hardened policies
* Prevents session hijacking continuation

---

## Outcome

✔ Identity layer fully reset
✔ Persistent access removed
✔ Zero disruption to production workloads
