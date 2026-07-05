

# Bible Audio Recall Store

This project store .m3u files about bible audio chapters
each .m3u is about one chapter
they are organized by directory books and testaments
the .m3u files refer content from emcitv.com

This organization is chosen for a good listening experience by the multimedia player MPV

## The project stucture

```
.
├── en
│   ├── 1_old_testament
│   │   ├── 01_genesis 
│   │   │   ├── 01.m3u
│   │   │   ├── 02.m3u
│   │   │   ├── 03.m3u
│   │   │   ├── 04.m3u
│   │   │   ├── 05.m3u
    ...
│   └── 2_new_testament
    ...
├── fr
│   ├── 1_old_testament 
│   │   ├── 01_genesis
│   │   │   ├── 01.m3u
│   │   │   ├── 02.m3u
│   │   │   ├── 03.m3u
│   │   │   ├── 04.m3u
│   │   │   ├── 05.m3u
    ... 
│   └── 2_new_testament
    ... 
├── fr2
│   ├── 1_old_testament
    ...
│   └── 2_new_testament
    ...
├── README.md
└── setup
    ├── post_setup
    ├── readme_setup.md
    ├── setup_datas
    └── setup.sh
```



## Use with MPV

For listen your bible with mpv you can
go at repo root
and write

```bash
mpv fr  #for listen in french 
mpv fr2 #for listen with another french voice
mpv en  #for listen in english
```


You can see here that mpv remember the last chapter I was listening 
For disable resuming playback type `mpv --no-resume-playback en`
sve your last position you should exit by typing `q` (no ctrl-c)
```
$ mpv en
Resuming playback. This behavior can be disabled with --no-resume-playback.
Resuming playback. This behavior can be disabled with --no-resume-playback.
Playing: en/1_old_testament
Resuming playback. This behavior can be disabled with --no-resume-playback.
Playing: en/1_old_testament/01_genesis
Resuming playback. This behavior can be disabled with --no-resume-playback.
Playing: en/1_old_testament/01_genesis/04.m3u
Resuming playback. This behavior can be disabled with --no-resume-playback.
Playing: https://audio.emcitv.com/audio/bible/en/audio-bible/OT/genesis/genesis-004.mp3
[ffmpeg/demuxer] mp3: Estimating duration from bitrate, this may be inaccurate
 ● Audio  --aid=1  (mp3 1ch 22050 Hz 32 kbps)
File tags:
 Artist: King James Version
 Album: www.firefighters.org
 Comment: Steven Johnston
 Genre: Speech
 Title: Genesis 4
 Track: 00
AO: [pipewire] 22050Hz stereo 2ch doublep
(Paused) A: 00:00:01 / 00:03:29 (1%) Cache: 206s/4MB
```


```bash
# To listen the exact book you want listen
mpv en/1_old_testament/01_genesis/

# to pass at next chapter type >
# to pass at previous chapter type <


# To listen the exact chapter you want listen
mpv en/1_old_testament/01_genesis/01.m3u
mpv en/1_old_testament/01_genesis/{05..10}.m3u

```

### Options recommandées pour MPV


```bash
# Infinit loop
mpv en --loop-playlist=inf
# Or type L for toogle between inf and normal mode

# Shuffle reading
mpv --playlist=old_testament/genese --shuffle
```

## Plalist generator

The script `setup/setup.sh` generate playlists automaticly. It extract the file information in `setup/setup_datas/` and creat the acording urls

For generate playlist run
```bash
bash setup/setup.sh
```


## Contributing

Feel free to fork/contribute to this project by:
- Improving the generation script
- Adding options for other audio sources
- Creating optimized MPV configurations for Bible listening

## License

[MIT]

## Notes

This is a personal project created to facilitate regular Bible listening.  
The referenced audio files belong to their respective owners (emcitv.com).

# Source for audios
https://emcitv.com/bible/audio/  
https://emcitv.com/bible/audio/osee-voix-fr1.html  
https://emcitv.com/bible/audio/osee-voix-fr2.html  
https://emcitv.com/bible/audio/osee-voix-en.html  

# Source for write number of chapter in the setup dataset
I am not catholic it's only usefull
https://www.catholic-resources.org/Bible/OT-Statistics-NAB.htm  
https://www.catholic-resources.org/Bible/NT-Statistics-Greek.htm    
