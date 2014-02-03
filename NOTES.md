# Team Year of the Horse


## Testing

You're way ahead of the pack on integrating this one.  Good job.

Beware integration tests, they're very slow comparatively.  I'm glad that
you're doing it and you're not heavy-handed about it, but just be careful.

## Migrations

None of your migrations are taking advantage of the constraints or defaults
available at the database layer.  Great developers let the DB do their work for
them.  Should a column ever be NULL?  Do you need 256 characters for a
username?  Think about these things.  Is a `deck_id` optional?

While you guard well against bad data in the code validations, what happens
when everyone decides Rails is no longer Cool and everything switches to Node
(or whatever **is** Cool)?  We can keep the DB and trust our data will stay
clean because Postgres knows the rules, not the application.

## where/first v. find

I may have spread some bad info here but...

http://stackoverflow.com/questions/9574659/rails-where-vs-find

is my new religion.

## N+1 Queries

I have added a route which does a bad thing.  I want you to know how to keep
your eyes out for an N+1 query.  

## Passwords

Make sure passwords are in an encrypted format

## Partials

Use partials to dry out code.  When you do an `each` and there is a ton of HTML
inside of the each block, that's a good opportunity for a partial to appear.

## Tables

Generally tables should be used ONLY for tabular data (like....a chart of
rainfall in the various microclimates of East Timor).  You have some cases
where it seems like there might have been a non-table based way of presenting
the data(?)
