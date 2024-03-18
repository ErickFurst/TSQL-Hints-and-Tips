declare @flags int
set @flags = 0

while (@flags < 9)
begin

print 
(CONVERT(NVARCHAR, @flags) + N' (' +
ISNULL(CASE WHEN (@flags = 0)     THEN FORMATMESSAGE(14561) END, '') +
ISNULL(CASE WHEN (@flags & 1) = 1 THEN FORMATMESSAGE(14558) + 
ISNULL(CASE WHEN (@flags > 1) THEN N', ' END, '') END, '') +
ISNULL(CASE WHEN (@flags & 2) = 2 THEN FORMATMESSAGE(14559) + 
ISNULL(CASE WHEN (@flags > 3) THEN N', ' END, '') END, '') +
ISNULL(CASE WHEN (@flags & 4) = 4 THEN FORMATMESSAGE(14560) END, '') + N')'
)

set @flags = @flags + 1

end
