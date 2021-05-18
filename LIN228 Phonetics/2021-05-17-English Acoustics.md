c# 2021-05-17 English Acoustics

## Tutorial
* Spectrum vs spectrogram


## Clarifications
* Obstruents 
  * obstruction to airflow
  * stops, fricatives, affricates
* Sonorants
  * free-ish airflow
  * nasals, liquids, glides, and vowelas
* Secondary and primary stress counts as 'stressed' for narrow transcriptions
* Most narrow transcription processes happen regardless of stress
  * Stressed proccesses:
    * Aspiration
    * Liquid devoicing (triggered by aspiration)
    * Vowel length (only marked in stressed syllables)
* Lax vowels don't appear in open syllables
* Broad vs Narrow Transcription
  * Broad transcription is all regular phonemic contrast in Canadian English +
    * Schwa in unstressed syllable
    * (lack of) vowel distinction before /r/
    * Primary stress on words of more than one syllable
    * Homorganic nasals & yod dropping
  * Narrow transcription is everything else 
## Narrow Transcription Line Drawings
* Narrow transcriptions can also be represented as line drawings 
* aspiration shown bu open labial, open coronal, open dorsal, closed velum, vociceless
## Spectrograms

* Spectrograms have three dimensions
  * Time (x-axis)
  * Frequency (y-axis)
  * Intensity (darkness)
    * the darker an area, the greater the intensity
    * horizontal bands of darkness are formants
    * vertical bands are vocal fold vibrations
  * formants counted up
* Two types
  * narrow-band
    * higher frequency resolution, easier to distinguish individual harmonics
    * harmonics being further apart means that F0 is higher
    * Count 10 harmonics, then divide by 10 to get approximanet F0
    * can easily see change of pitch throughout a word
      * see f0 go lower or hgiher 
  * Wide-band spectrograms
    * higher temporal resolution
    * easier to see individual wave cycles as formants
    * easier to see the formants as bands of energy
    * see movement of formants and what shape they are
    * useful for categorizing segments
    * f0 are the vertical lines (pulses of the vocal folds), cant actually see harmonics
### Categorization
* every speech sound has a unique acoustic pattern that can be identifierd
* manner is the most easily distinguishable 
  * vowels & glides
    * very dark stripes starting at low frequencies
    * dark stripes are formants
    * glides are rapidly articulated vowels
      * will look similarly on a spectrogram, often difficult to find where a spectrogram a vowel ends and a glide begins
    * spectrograms of diff. vowels are distinguished from another using formants
      * formants are clusters of harmonicsenhanced by teh resonating properties of the vocal tract
      * configuration of vocal tract leads to diff forman frequencies in each vowel
      * f1 (determined by back cavity) is lower for high vowels (larger back cavity, lower resonating freq.) and higher for low vowels (smaller back cavity, higher res freq.)
      * f2 (determined by front cavity) higher for front vowels (smaller front cavity, higher res. freq.) lower for back vowels (larger front cavity, lower res freq)
        * even lower for rounded vowels because front cavity is larger due to lip protusion
      * f3 is similar to f2 but higher
      * there is a 'range' of formant frequencies that are acceptable
      * schwa has equally spaced formants
  * fricatives & affricates
    * characterized by random noise usually at high frequencies
    * large areas of intensities
    * no formants
      * particularly trtue for voiceless
    * sibilant fricatives tend to be darker /s z esh, ezsh/ easier than other fricatives /f v, etc/
      * greater intensity
    * alveolars have higher frequency noise around 4kHz
    * postalveolars are lower, around 2-6kHz
    * voiced fricatives have a voiced bar 
      * noise of fricative but also voicing near the bottom
    * /h/ is a 'voiceless vowel'
      * week formant pattern with overlaid noise
    * affricates are stop + fricative
  * stops
    * period of silence, followed by short burst of energy
    * apsirated stops will be followed by a longer period of fricative-like noise with light formants that match the formants of the following vowel
    * velar pinch
      * f2 and f3 kind of merging together
      * formants point low towards stop in bilaiblas
      * in velars, locus points up (f2), causing it to pinch towards f3
      * if f2 is lower than 1700Hz, it points up, otherwise poitns up (points towards 1700Hz)
        * vowel gets further back, the transition lowers more into the vowel
      * alveolars have a middle locus
      * bilabials have a low freq locus
      * velars have a high locus
      
  * dipthongs
    * characterized by movement of formants
    * /aj/ begins with relatively high f1 because of initial low vowel and relatively low f2 because of central vowel, them moves to low f1 and high f2 of high front vowel /i/
    * /aw/ begins like /aj/, then f1 lowers and f2 lowers since /u/ is further higher and back than central-front /a/
    * /ɔj/ begins f1 f2 low and close, then spread really far apart
  * rhoticization
    * causes lowering of f3
    * rhoticization happens by curiling back tongue tip or retracting tongue tip into body of the tongue
    * hollowing of the tongue body
  * nasals
    * weak formant pattern and a voice bar
    * some energy around 500hz and some around 3-4kHz
