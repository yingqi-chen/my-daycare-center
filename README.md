# My Daycare Center

It is created to present the top 10 local day care centers according to user input.

## Installation

Put this to your terminal:

```ruby
git clone git@github.com:chanwkkk/my-daycare-center.git
```

And then go inside the folder by typing this in your terminal:

```
cd my-daycare-center
```

And then install all missing gems by input:
```
bundle install
```

And then you can run the program by running:

```
shotgun
```
After that, you should be able to see the following sentences:

```
// ♥ shotgun
Your server is running at 165.227.16.205:43821
===================LOGS=========================
== Shotgun/Thin on http://0.0.0.0:9393/
Thin web server (v1.7.2 codename Bachmanity)
Maximum connections set to 1024
Listening on 0.0.0.0:9393, CTRL+C to stop

```
It tells you the IP address you should open with your favorite browser, which for example, is  `165.227.16.205:43821` here, but yours would be different.
Now your website is working, go check out the website I make and let me know if you have any suggestions, thanks!

## Usage

On the home page, you will have the choice to view a list of reviews or centers. When you go to `reviews`, you will see a list of reviews and the details including commenter, the rate and the center being rated, and also you can view more details of the review by clicking into "Read content", or view the center page by clicking on the name of it. On the other way, when you choose `Centers`, you will see a list of centers presented in the following format: "center-name: address-name".

Plus, there is a sign up link and a log in link. You have to sign up with an email and that has to be unique. Every email can be only registered one time and thus it will be able to distinguish users. After you sign up and log in, you have the right to view your own file, which tells you what reviews you have made and lets you makes another review on a center, a pre-existed one or one you can create when you create a new review. You also have the right to delete or edit the review that belongs to you.  

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/chanwkkk/my-daycare-center.git.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
