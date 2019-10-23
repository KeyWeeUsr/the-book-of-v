fn guess(input string, word string, mask string) string {
    mut new_mask := mask

    if input.len > 1 {
        if input == word {
            new_mask = word
        }
    } else if input.len == 1 {
        mut buffer := ""
        for idx, value in word {
            if value == mask[idx] {
                buffer += mask[idx].str()
                continue
            }

            if value != input[0] {
                buffer += "-"
                continue
            }

            buffer += word[idx].str()
        }
        new_mask = buffer
    }
    return new_mask
}
