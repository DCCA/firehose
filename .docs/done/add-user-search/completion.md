# Completion: Add User Search by Email

## What Changed

Added `GET /users?email=` to the users API. Case-insensitive lookup, returns an array (empty if no match). Three files changed, four tests added.

## How to Verify

1. Start the API server.
2. `curl "http://localhost:3000/users?email=alice@example.com"` — should return the user.
3. `curl "http://localhost:3000/users?email=ALICE@EXAMPLE.COM"` — same result (case-insensitive).
4. `curl "http://localhost:3000/users?email=nobody@example.com"` — should return `[]`.
5. `curl "http://localhost:3000/users/42"` — existing endpoint unchanged.

## Risks & Follow-ups

- **Rate limiting**: The email search has no throttling. This could enable email enumeration. Tracked as a separate change.
- **Performance**: Using `LOWER()` in SQL is fine at current scale but would need a functional index if user volume grows significantly.
