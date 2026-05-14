---
name: finishing-a-development-branch
description: "Use when implementation is complete and tests pass — verify, present options for merge/PR/cleanup, execute choice."
---

# Finishing a Development Branch

Guide completion of development work by presenting clear options and handling the chosen workflow.

**Core principle:** Verify tests → Detect environment → Present options → Execute → Clean up.

**Announce at start:** "I'm using the finishing-a-development-branch skill to complete this work."

## The Process

### Step 1: Verify Tests

**Before presenting options, verify tests pass:**

```bash
# Run project's test suite
npm test / cargo test / pytest / go test ./...
```

**If tests fail:**
```
Tests failing (<N> failures). Must fix before completing:

[Show failures]

Cannot proceed with merge/PR until tests pass.
```

Stop. Don't proceed to Step 2.

**If tests pass:** Continue to Step 2.

### Step 2: Detect Environment

**Determine workspace state before presenting options:**

```bash
GIT_DIR=$(cd "$(git rev-parse --git-dir)" 2>/dev/null && pwd -P)
GIT_COMMON=$(cd "$(git rev-parse --git-common-dir)" 2>/dev/null && pwd -P)
```

| State | Menu | Cleanup |
|-------|------|---------|
| `GIT_DIR == GIT_COMMON` (normal repo) | Standard 4 options | No worktree |
| `GIT_DIR != GIT_COMMON`, named branch | Standard 4 options | Provenance-based |
| `GIT_DIR != GIT_COMMON`, detached HEAD | Reduced 3 options (no merge) | No cleanup |

### Step 3: Determine Base Branch

```bash
git merge-base HEAD main 2>/dev/null || git merge-base HEAD master 2>/dev/null
```

Or ask: "This branch split from main - is that correct?"

### Step 4: Present Options

**Normal repo and named-branch worktree — present exactly these 4 options:**

```
Implementation complete. What would you like to do?

1. Merge back to <base-branch> locally
2. Push and create a Pull Request
3. Keep the branch as-is (I'll handle it later)
4. Discard this work

Which option?
```

**Detached HEAD — present these 3 options (no merge):**

```
Implementation complete. What would you like to do?

1. Push and create a Pull Request
2. Keep the branch as-is (I'll handle it later)
3. Discard this work

Which option?
```

### Step 5: Execute Choice

**Option 1 — Merge locally:**
```bash
git checkout <base-branch>
git merge --no-ff <branch-name>
git branch -d <branch-name>
```

**Option 2 — Push and create PR:**
```bash
git push origin <branch-name>
# Then create PR via GitHub CLI or browser
gh pr create --fill
```

**Option 3 — Keep for later:**
No action needed. Announce cleanup instructions.

**Option 4 — Discard:**
```
Are you sure? This will delete all changes.
git branch -D <branch-name>  # force delete
```

### Step 6: Cleanup

After merge/PR:
- Delete the work branch if applicable
- Announce completion

## Remember

- **Always verify tests first** — never present options with failing tests
- **Choose menu based on environment** — git worktree vs normal repo
- **Get explicit confirmation for destructive actions** (discard)