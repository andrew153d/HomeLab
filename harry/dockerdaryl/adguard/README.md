# AdGuard Home

Quick notes for configuring AdGuard Home on **dockerdaryl**.

## DNS rewrite (wildcard)

Use this when you want all subdomains of a domain to resolve to a single internal IP (e.g., pointing `*.forge.com` at a service host).

1. Open the AdGuard Home admin UI.
2. Go to:
	- **Filters** → **DNS rewrites**
3. Click **Add DNS rewrite**.
4. Add an entry:
	- **Domain:** `*.forge.com`
	- **IP address:** `192.168.1.185`

### Notes

- This creates a local override inside AdGuard Home (clients using AdGuard for DNS will get this answer).