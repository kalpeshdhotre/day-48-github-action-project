# GitHub Actions Capstone — Day 48

A small Node.js/Express app with a `/health` endpoint, containerized with a
multi-stage Dockerfile, wired to a full CI/CD pipeline built entirely from
reusable GitHub Actions workflows.

![PR Pipeline](https://github.com/kalpeshdhotre/day-48-github-action-project/actions/workflows/pr-pipeline.yml/badge.svg)
![Main Pipeline](https://github.com/kalpeshdhotre/day-48-github-action-project/actions/workflows/main-pipeline.yml/badge.svg)
![Health Check](https://github.com/kalpeshdhotre/day-48-github-action-project/actions/workflows/health-check.yml/badge.svg)

## What's here

- `server.js` / `package.json` — Express app, single `/health` endpoint
- `test.sh` — curls `/health` and checks for a 200
- `Dockerfile` — multi-stage build (deps → runtime)
- `.github/workflows/reusable-build-test.yml` — install + test, reusable
- `.github/workflows/reusable-docker.yml` — Buildx build + push, reusable
- `.github/workflows/pr-pipeline.yml` — test-only checks on PRs to `main`
- `.github/workflows/main-pipeline.yml` — test → build/push → scan → deploy on push to `main`
- `.github/workflows/health-check.yml` — cron health ping every 12 hours

See `day-48-actions-project.md` for the full write-up, architecture diagram,
and screenshots.
