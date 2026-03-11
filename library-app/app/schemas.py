from typing import Optional
from pydantic import BaseModel
from datetime import date


class AuthorBase(BaseModel):
    name: str
    bio: Optional[str]


class BookBase(BaseModel):
    title: str
    description: Optional[str] = None
    author_id: Optional[int] = None
    isbn: Optional[str] = None
    available: Optional[bool] = True


class BookCreate(BookBase):
    pass


class Book(BookBase):
    id: int

    class Config:
        orm_mode = True


class User(BaseModel):
    id: int
    name: str
    email: Optional[str]


class LoanBase(BaseModel):
    book_id: int
    user_id: int
    start_date: date
    due_date: date
    returned: Optional[bool] = False
