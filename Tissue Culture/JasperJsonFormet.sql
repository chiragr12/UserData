Jasper Qr show Json formet data with seperate line:-

"{" + System.getProperty("line.separator") +
  "\"CropType\": \"" + $F{croptype} + "\"," + System.getProperty("line.separator") +
  "\"Variety\": \"" + $F{variety} + "\"," + System.getProperty("line.separator") +
  "\"ParentCultureLine\": \"" + $F{parentcultureline} + "\"," + System.getProperty("line.separator") +
  "\"Date\": \"" + $F{date} + "\"," + System.getProperty("line.separator") +
  "\"NatureOfSample\": \"" + $F{naturesample} + "\"," + System.getProperty("line.separator") +
  "\"CultureSubStage\": \"" + $F{culturestage} + "\"," + System.getProperty("line.separator") +
  "\"CycleNumber\": \"" + $F{cycleno} + "\"," + System.getProperty("line.separator") +
  "\"VirusTestingResult\": \"" + $F{virusresult} + "\"" + System.getProperty("line.separator") +
"}"


Jasper data in same line:-

"{" +
  "\"Crop Type\": \"" + $F{croptype} + "\"," +
  "\"Variety\": \"" + $F{variety} + "\"" +
"}"
