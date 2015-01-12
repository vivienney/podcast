# Steercast
## A podcast covering all things web development & design brought to you by the team at Steer

### Podcast pre-release checklist
Make sure all of these are done for each episode before you release online
- Export the episode from Garageband in mp3 format medium quality (filename should just be episode number e.g `01.mp3`, `02.mp3`)
- Listen through to check that volume levels sound good
- Upload to Steer S3 account under `podcast` bucket
- Create a new episode markdown file from a old episode, these can be found in the `_episodes` folder
- Rename it to the new episode number
- Fill out the variables at the top of the episodes markdown file
  - `title` - the episode number
  - `long_title` - episode number and catchy title
  - `date` - Strict date format should be `YYYY-MM-DD HH:MM:SS` time can be a rough estimate
  - `quote` - This should be a nice short quote as it has to be within **87 characters** to fit within a tweet
  - `audio_link` - The url that the audio file is stored in S3, it will look something like this `http://steer-podcast.s3-eu-west-1.amazonaws.com/02.mp3`
  - `duraion` - Length of the podcast in `MM:SS` format
  - `length` - This is an odd one, this is the size of the file in bytes you can get this by `Right Click -> Get Info` the filed is called `Size` copy the value but remove the commas.
  - `summary` - A short description about the contents of the podcast, I normally use this as the beginning sentence to main show notes.
- Write the main contents of the show notes, start with a description of the what the show contains (I normally use the summary from above)
- Then use an `h4` tag for headings int the content normally just **Links**
- Create a heading called **Listener Questions**, these are just a list of links and the href value is the time the question is talked about it should in this format `#t=MM:SS`
- If you have been creating this draft in a feature branch just merge it with `gh-pages` and push to github
