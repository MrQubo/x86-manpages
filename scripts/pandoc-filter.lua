local text = require 'text'

-- Convert headers to uppercase
function Header (h)
  return pandoc.walk_block(h,
    {
      Str = function (s)
        return pandoc.Str(text.upper(s.text))
      end
    }
  )
end
