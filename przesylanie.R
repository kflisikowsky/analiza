library(piggyback)
gitcreds::gitcreds_set()

gh::gh_whoami()

gh::gh(
  "/repos/{owner}/{repo}",
  owner = "kflisikowsky",
  repo = "analiza"
)

dane <- read.csv("~/Desktop/folder/analiza_test/dane.csv")

readr::write_tsv(dane, "dane.tsv.gz") #pakowanie

pb_release_create(repo = "kflisikowsky/analiza", 
                  tag = "v1.0.5")


# przesył na githuba: 
piggyback::pb_upload(
  file = "dane.tsv.gz",
  repo = "kflisikowsky/analiza",
  tag = "v1.0.5"
)

# jak skorzystać z tych danych?
pb_download("dane.tsv.gz", 
            repo = "kflisikowsky/analiza",
            tag = "v1.0.5",
            dest = tempdir())


