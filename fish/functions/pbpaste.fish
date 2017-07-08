function pbpaste -d "Removes the data from the pasteboard and writes it to the standard output"
  xsel --clipboard --output
end
