def caesar_cipher(string, shift_factor)

  # Create an array of lowercase letters from 'a' to 'z'
  alphabet_lower = ('a'..'z').to_a 
  
  # Create an array of uppercase letters from 'A' to 'Z'
  alphabet_upper = ('A'..'Z').to_a 
  
  # Initialize an empty array to hold the final result of shifted characters
  final_string = []
  
  # Split the input string into individual characters and iterate over each character
  string.split('').each do |letter|
    
    # Check if the character is neither a lowercase nor an uppercase letter
    if !alphabet_lower.include?(letter) && !alphabet_upper.include?(letter)
      # If not a letter, add the character to the final_string array unchanged
      final_string.push(letter)

    # Check if the character is an uppercase letter
    elsif letter == letter.upcase && alphabet_upper.include?(letter)
      # Find the index of the letter in the uppercase alphabet array
      index = alphabet_upper.find_index(letter)
      
      # Shift the letter by shift_factor and wrap around using modulo 26
      letter = alphabet_upper[((index + shift_factor) % 26)]
      
      # Add the shifted uppercase letter to the final_string array
      final_string.push(letter)

    # Check if the character is a lowercase letter
    elsif letter == letter.downcase && alphabet_lower.include?(letter)
      # Find the index of the letter in the lowercase alphabet array
      index = alphabet_lower.find_index(letter) 
      
      # Shift the letter by shift_factor and wrap around using modulo 26
      letter = alphabet_lower[((index + shift_factor) % 26)]
      
      # Add the shifted lowercase letter to the final_string array
      final_string.push(letter)
    end
  end

  # Join the array of characters into a single string and print the result
  puts final_string.join
end

# Test cases
caesar_cipher("a man a plan coding", 2)  # Shift each letter in the string by 2 positions forward
caesar_cipher("th1s is a mOre ComplicAted code!!", 21)  # Shift each letter by 21 positions forward
caesar_cipher("It is What It iS??", -5)  # Shift each letter by 5 positions backward
caesar_cipher("Will this WoRk??", 534)  # Shift each letter by 534 positions forward (equivalent to shifting by 534 % 26)
