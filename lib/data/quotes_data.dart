import '../models/quote_model.dart';

final List<String> categories = [
  'Motivation',
  'Education',
  'Self-Confidence',
  'Life',
  'Success',
  'Positive Thinking'
];

final List<Quote> quotesData = [
  // Motivation
  const Quote(
    id: 'm1',
    quote: 'The only way to do great work is to love what you do.',
    author: 'Steve Jobs',
    category: 'Motivation',
  ),
  const Quote(
    id: 'm2',
    quote: 'Believe you can and you\'re halfway there.',
    author: 'Theodore Roosevelt',
    category: 'Motivation',
  ),
  const Quote(
    id: 'm3',
    quote: 'Do what you can, with what you have, where you are.',
    author: 'Theodore Roosevelt',
    category: 'Motivation',
  ),
  const Quote(
    id: 'm4',
    quote: 'It does not matter how slowly you go as long as you do not stop.',
    author: 'Confucius',
    category: 'Motivation',
  ),
  
  // Education
  const Quote(
    id: 'e1',
    quote: 'Education is the most powerful weapon which you can use to change the world.',
    author: 'Nelson Mandela',
    category: 'Education',
  ),
  const Quote(
    id: 'e2',
    quote: 'The beautiful thing about learning is that no one can take it away from you.',
    author: 'B.B. King',
    category: 'Education',
  ),
  const Quote(
    id: 'e3',
    quote: 'An investment in knowledge pays the best interest.',
    author: 'Benjamin Franklin',
    category: 'Education',
  ),
  const Quote(
    id: 'e4',
    quote: 'Education is not the learning of facts, but the training of the mind to think.',
    author: 'Albert Einstein',
    category: 'Education',
  ),

  // Self-Confidence
  const Quote(
    id: 'sc1',
    quote: 'No one can make you feel inferior without your consent.',
    author: 'Eleanor Roosevelt',
    category: 'Self-Confidence',
  ),
  const Quote(
    id: 'sc2',
    quote: 'To be yourself in a world that is constantly trying to make you something else is the greatest accomplishment.',
    author: 'Ralph Waldo Emerson',
    category: 'Self-Confidence',
  ),
  const Quote(
    id: 'sc3',
    quote: 'Trust yourself. You know more than you think you do.',
    author: 'Benjamin Spock',
    category: 'Self-Confidence',
  ),
  const Quote(
    id: 'sc4',
    quote: 'Confidence comes not from always being right but from not fearing to be wrong.',
    author: 'Peter T. McIntyre',
    category: 'Self-Confidence',
  ),

  // Life
  const Quote(
    id: 'l1',
    quote: 'Life is what happens when you\'re busy making other plans.',
    author: 'John Lennon',
    category: 'Life',
  ),
  const Quote(
    id: 'l2',
    quote: 'In the end, it\'s not the years in your life that count. It\'s the life in your years.',
    author: 'Abraham Lincoln',
    category: 'Life',
  ),
  const Quote(
    id: 'l3',
    quote: 'Life is either a daring adventure or nothing at all.',
    author: 'Helen Keller',
    category: 'Life',
  ),
  const Quote(
    id: 'l4',
    quote: 'Two roads diverged in a wood, and I—I took the one less traveled by, And that has made all the difference.',
    author: 'Robert Frost',
    category: 'Life',
  ),

  // Success
  const Quote(
    id: 's1',
    quote: 'Success is not final, failure is not fatal: It is the courage to continue that counts.',
    author: 'Winston S. Churchill',
    category: 'Success',
  ),
  const Quote(
    id: 's2',
    quote: 'Definiteness of purpose is the starting point of all achievement.',
    author: 'W. Clement Stone',
    category: 'Success',
  ),
  const Quote(
    id: 's3',
    quote: 'I have not failed. I\'ve just found 10,000 ways that won\'t work.',
    author: 'Thomas A. Edison',
    category: 'Success',
  ),
  const Quote(
    id: 's4',
    quote: 'Innovation distinguishes between a leader and a follower.',
    author: 'Steve Jobs',
    category: 'Success',
  ),

  // Positive Thinking
  const Quote(
    id: 'pt1',
    quote: 'The mind is everything. What you think you become.',
    author: 'Buddha',
    category: 'Positive Thinking',
  ),
  const Quote(
    id: 'pt2',
    quote: 'Whether you think you can or you think you can\'t, you\'re right.',
    author: 'Henry Ford',
    category: 'Positive Thinking',
  ),
  const Quote(
    id: 'pt3',
    quote: 'Once you replace negative thoughts with positive ones, you\'ll start having positive results.',
    author: 'Willie Nelson',
    category: 'Positive Thinking',
  ),
  const Quote(
    id: 'pt4',
    quote: 'Keep your face to the sunshine and you cannot see a shadow.',
    author: 'Helen Keller',
    category: 'Positive Thinking',
  ),
];
