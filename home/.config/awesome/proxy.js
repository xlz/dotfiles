var default_proxies = [
//"SOCKS5 localhost:10022",
//"PROXY hostname:port",
"DIRECT",
];

function FindProxyForURL(url, host) {
if (shExpMatch(host, "localhost")) return "DIRECT";
if (shExpMatch(host, "192.168.*")) return "DIRECT";
if (shExpMatch(host, "127.0.*")) return "DIRECT";

return default_proxies.join("; ");
}
