attribute = 4
history ||= {}
history[attribute] ||= []
history[attribute] << 77
history[attribute] << 65
puts history.inspect