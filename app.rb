# encoding: utf-8

require 'sinatra'
require 'json'

set :public_folder, File.dirname(__FILE__) + '/static'

quotes = [
  { file: "1", link:"do-not-make-friends", quote: "We\'re not here to make friends, we are not saving the fucking manatees here guys." },
  { file: "2", link:"your-friends-are-shit", quote: "Your friends are shit. You tell em you made 25 grand last month they\'re not gonna fucking believe you. Fuck them! Fuck \'em!" },
  { file: "3", link:"fuck-you-mom-and-dad", quote: "Parents don\'t like the life you lead. Fuck your mom and dad." },
  { file: "4", link:"dont-waste-my-fucking-time", quote: "But if you really want this, you call me on Monday and we\'ll talk. Just don\'t waste my fucking time." },
  { file: "5", link:"coffee-is-for-closers-only", quote: "Put that coffee down. Coffee\'s for closers only." },
  { file: "6", link:"your-fired", quote: "I don\'t have to listen to this shit. -- You certainly don\'t pal. \'Cause the good news is -- you\'re fired." },
  { file: "7", link:"sales-contest", quote: "This months sales contest. First prize is a Cadillac Eldorado. Second prize\'s a set of steak knives. Third prize is you\'re fired." },
  { file: "8", link:"you-got-leads", quote: "You got leads. Mitch and Murray pafile good money. Get their names to sell them!" },
  { file: "9", link:"you-cant-close-shit", quote: "You can\'t close the leads you\'re given, you can\'t close shit, you ARE shit, hit the bricks pal and beat it \'cause you are going out!" },
  { file: "10", link:"fuck-you-thats-my-name", quote: "FUCK YOU, that\'s my name!! You know why, Mister? \'Cause you drove a Hyundai to get here tonight, I drove a $80 000 BMW. That\'s my name!" },
  { file: "11", link:"only-one-thing-counts-in-this-life", quote: "Because only one thing counts in this life! Get them to sign on the line which is dotted! You hear me, you fucking faggots?" },
  { file: "12", link:"abc-always-be-closing", quote: "A-B-C. A-always, B-be, C-closing. Always be closing! Always be closing!" },
  { file: "13", link:"get-out-of-the-rain", quote: "A-I-D-A; get out there!! You got the prospects comin\' in; you think they came in to get out of the rain?" },
  { file: "14", link:"that-watch-cost-more-than-your-car", quote: "You see this watch? You see this watch? That watch cost more than your car." },
  { file: "15", link:"good-father-fuck-you", quote: "Good father? Fuck you -- go home and play with your kfiles! You wanna work here? Close!" },
  { file: "16", link:"fifteen-thousand-dollars", quote: "I can go out there tonight with the materials you got, make myself fifteen thousand dollars! Tonight! In two hours! Can you?" },
  { file: "17", link:"a-sell-is-mad", quote: "A sell is made. The only question is: who\'s gonna close? You or him?" },
  { file: "18", link:"money-problems", quote: "Somebody tells you they money problems about buyin 200 shares is lying to you." },
  { file: "19", link:"become-a-millionaire", quote: "There\'s no question as to whether you become a millionaire working here. The only question is, how many times over." },
  { file: "20", link:"first-million", quote: "Become an employee of this firm, you will make your first million within 3 years." },
  { file: "21", link:"i-am-a-fucking-millionair", quote: "I am a fucking millionaire. And guess how old I am...27, you know what that makes me here? A fucking senior citizen." },
  { file: "22", link:"call-me-tomorrow", quote: "Guy says call me tommorrow? Bullshit!" },
  { file: "23", link:"dead-fucking-serious", quote: "If you can\'t learn how to close, you better start thinkin about another career. And I am deadly serious about that. Dead fuckin serious." },
  { file: "24", link:"money-hungry", quote: "Now you all look money hungry and that\'s good." },
  { file: "25", link:"root-of-all-evil", quote: "Anybody who tells you that money is the root of all evil, doesn\'t fucking have any." },
  { file: "26", link:"they-say-money-cant-buy-happiness", quote: "They say money can\'t buy happiness. Look at the fucking smile on my face!" },
  { file: "27", link:"i-drive-a-ferrari", quote: "I drive a Ferrari 355 Cabriolet. What\'s up?" },
  { file: "28", link:"required-to-work-your-fucking-ass-off", quote: "You are required to work your fucking ass off at this firm. We want winners here, not pikers." },
  { file: "29", link:"vacation-time", quote: "A Piker asks how much vacation time you get in the first year. You want vacation time, go teach third grade at a public school." },
  { file: "30", link:"become-filthy-rich", quote: "People come to work at this firm for one reason, to become filthy rich, that\'s it." },
  { file: "31", link:"learn-how-to-push", quote: "You have to be closing all the time. And be aggressive, learn how to push!" },
  { file: "32", link:"get-on-the-phone", quote: "So get on the phones, it\'s time to get to work. Get off your ass!" },
  { file: "33", link:"just-get-a-yes", quote: "Talk to \'em. Ask \'em questions... ask \'em rhetorical questions, it doesn\'t matter, anything, just get a yes out of \'em." },
  { file: "34", link:"if-you-are-drowning", quote: "If you\'re drowning and I throw you a life jacket would you grab it? Yes! Good. Pick up 300 shares I won\'t let you down." },
  { file: "35", link:"thrity-fourty-precent-returns", quote: "Ask them how they\'d like to see thirty, forty percent returns. What are they gonna say, no? Fuck you?" },
  { file: "36", link:"think-about-another-career", quote: "If you can\'t learn how to close, you better start thinkin about another career. And I am deadly serious about that. Dead fuckin serious." },
  { file: "37", link:"no-such-thing-as-a-no-sell-call", quote: "And there is no such thing as a no-sell call." },
  { file: "38", link:"a-sell-is-made-on-every-call", quote: "A sell is made on every call you make. Either you sell the client some stock, or he sells you on a reason he can\'t." }
]

get '/' do
  quote = quotes.select { |q| q[:link] == "abc-always-be-closing" }[0]
  erb :index, locals: {
    quote: quote,
    start: true
  }
end

get '/random' do
  quote = quotes[rand(quotes.length)]
  redirect to('/'+quote[:link])
end

get '/:quote' do
  quote = quotes.select { |q| q[:link] == params[:quote] }[0]
  erb :index, locals: {
    quote: quote,
    start: false
  }
end
