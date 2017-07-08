function pbcopy -d "Takes the standard input and places it in the specified pasteboard"
  xsel --clipboard --input
end
