# Internal Project Notes

## Project Overview

FastAPI application with user authentication system targeting Hebrew-speaking users.

## Technical Stack

- Backend: FastAPI
- Database: SQLAlchemy models present
- Authentication: JWT (stateless, token-based)
- UI: RTL support required for Hebrew

## Key Decisions

1. JWT chosen over OAuth2 for simplicity
2. RTL layout mandatory for Hebrew users
3. Brand identity: Ocean Blue (#0077be) + Assistant font

## Project Structure

```
app/
  - crud.py (database operations)
  - database.py (database connection)
  - main.py (FastAPI app)
  - models.py (SQLAlchemy models)
  - schemas.py (Pydantic schemas)
docs/
  - decisions.md (technical decisions)
  - ui_specs.md (UI requirements)
  - tasks.md (task tracking)
  - README.md (docs index)
```

## Next Steps

- Implement JWT authentication endpoints
- Add password hashing (bcrypt/passlib)
- Create protected route decorators
- Implement token refresh logic
- Build UI with RTL support

## Notes

- Keep authentication simple initially
- Consider OAuth2 migration path for future
- Ensure all UI components support RTL properly
