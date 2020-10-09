#!/bin/sh
cwd="$PWD"
cd "${0%/*}"
cat >config.json <<EOF
{
  "ociVersion": "1.0.1",
  "process": {
    "terminal": true,
    "user": {"uid": $(id -u), "gid": $(id -g)},
    "args": [$(printf '"%s",\n' "$@" | sed '$s/,$//')],
    "env": [$(env | sed 's/.*/"&",/;$s/,$//')],
    "cwd": "$cwd",
    "capabilities": {
      "bounding": [
        "$(capsh --print | sed '2!d;s/.*=//;s/,/", "/g' | tr a-z A-Z)"
      ]
    }
  },
  "root": {"path": "rootfs"},
  "mounts": [
    {"destination": "/proc", "type": "proc", "source": "proc"},
    {"destination": "/sys", "type": "bind", "source": "/sys", "options": ["bind"]},
    {"destination": "/dev", "type": "bind", "source": "/dev", "options": ["rbind"]},
    {"destination": "/run", "type": "bind", "source": "/run", "options": ["rbind"]},
    {"destination": "/tmp", "type": "bind", "source": "/tmp", "options": ["bind"]},
    {"destination": "/home", "type": "bind", "source": "/home", "options": ["bind"]},
    {"destination": "/etc/resolv.conf", "type": "bind", "source": "/etc/resolv.conf", "options": ["bind", "ro"]},
    {"destination": "/etc/hosts", "type": "bind", "source": "/etc/hosts", "options": ["bind", "ro"]},
    {"destination": "/etc/passwd", "type": "bind", "source": "/etc/passwd", "options": ["bind", "ro"]},
    {"destination": "/etc/shadow", "type": "bind", "source": "/etc/shadow", "options": ["bind", "ro"]},
    {"destination": "/etc/group", "type": "bind", "source": "/etc/group", "options": ["bind", "ro"]},
    {"destination": "/etc/gshadow", "type": "bind", "source": "/etc/gshadow", "options": ["bind", "ro"]}
  ],
  "linux": {
    "namespaces": [
      {"type": "pid"},
      {"type": "ipc"},
      {"type": "mount"}
    ]
  }
}
EOF

exec sudo runc run container$$
