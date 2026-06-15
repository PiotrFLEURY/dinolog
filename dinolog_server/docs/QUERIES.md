# Queries

## Count Logs

```bash
curl -X POST -d "{\"from\":\"2026-06-12 00:00:00 +0000\", \"to\":\"2026-06-13 00:00:00 +0000\"}" -H "Content-Type: application/json" http://localhost:3000/logs/count
```