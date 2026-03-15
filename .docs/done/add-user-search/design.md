# Design: Add User Search by Email

## Approach

Reuse the existing `UserRepository.findBy()` method by adding an optional `email` filter. The controller checks for the `email` query param and delegates to the repository. No new database indexes needed — the `users.email` column already has a unique index.

## Key Decisions

| Decision | Choice | Why |
|----------|--------|-----|
| Case handling | `LOWER()` in SQL | Simpler than adding a functional index; email volume is low |
| Return shape | Array (not single object) | Consistent with collection endpoints; empty array for no match |
| No pagination | Omitted | Email is unique, so at most one result |

## Files Changed

- `src/controllers/users.ts` — added query param parsing
- `src/repositories/user.ts` — added email filter to `findBy()`
- `tests/users.test.ts` — 4 new test cases

## Risks

- No rate limiting on the search endpoint. A follow-up change should add throttling to prevent email enumeration.
