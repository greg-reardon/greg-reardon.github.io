A Github Pages template for academic websites. This was forked (then detached) by [Stuart Geiger](https://github.com/staeiou) from the [Minimal Mistakes Jekyll Theme](https://mmistakes.github.io/minimal-mistakes/), which is © 2016 Michael Rose and released under the MIT License. See LICENSE.md.

I think I've got things running smoothly and fixed some major bugs, but feel free to file issues or make pull requests if you want to improve the generic template / theme.

### Note: if you are using this repo and now get a notification about a security vulnerability, delete the Gemfile.lock file. 

# Instructions

1. Register a GitHub account if you don't have one and confirm your e-mail (required!)
1. Fork [this repository](https://github.com/academicpages/academicpages.github.io) by clicking the "fork" button in the top right. 
1. Go to the repository's settings (rightmost item in the tabs that start with "Code", should be below "Unwatch"). Rename the repository "[your GitHub username].github.io", which will also be your website's URL.
1. Set site-wide configuration and create content & metadata (see below -- also see [this set of diffs](http://archive.is/3TPas) showing what files were changed to set up [an example site](https://getorg-testacct.github.io) for a user with the username "getorg-testacct")
1. Upload any files (like PDFs, .zip files, etc.) to the files/ directory. They will appear at https://[your GitHub username].github.io/files/example.pdf.  
1. Check status by going to the repository settings, in the "GitHub pages" section
1. (Optional) Use the Jupyter notebooks or python scripts in the `markdown_generator` folder to generate markdown files for publications and talks from a TSV file.

See more info at https://academicpages.github.io/

## To run locally (not on GitHub Pages, to serve on your own computer)

On Windows, install Ruby 3.3 with DevKit:

```powershell
winget install --id RubyInstallerTeam.RubyWithDevKit.3.3 --exact --source winget
```

Open a new terminal after installation so Ruby is on `PATH`. If the native build
tools were not installed, run `ridk install` and select option 3 (MSYS2 and MINGW
development toolchain). See [Jekyll's Windows setup guide](https://jekyllrb.com/docs/installation/windows/).

From the repository directory, install the dependencies:

```powershell
gem install bundler -v 2.4.17 --no-document
bundle _2.4.17_ config set --local path vendor/bundle
bundle _2.4.17_ install
```

Start the local site:

```powershell
bundle _2.4.17_ exec jekyll serve --config _config.yml,_config.dev.yml --host 127.0.0.1 --force_polling
```

Open <http://localhost:4000>. Jekyll rebuilds when content changes; refresh the
browser to see updates. Polling avoids the obsolete Windows `wdm` extension.
Restart the server after changing configuration files.
Press Ctrl+C to stop it. The development configuration uses local links and
disables analytics. Keep `Gemfile.lock` so local installs use the same dependency
versions.

# Changelog -- bugfixes and enhancements

There is one logistical issue with a ready-to-fork template theme like academic pages that makes it a little tricky to get bug fixes and updates to the core theme. If you fork this repository, customize it, then pull again, you'll probably get merge conflicts. If you want to save your various .yml configuration files and markdown files, you can delete the repository and fork it again. Or you can manually patch. 

To support this, all changes to the underlying code appear as a closed issue with the tag 'code change' -- get the list [here](https://github.com/academicpages/academicpages.github.io/issues?q=is%3Aclosed%20is%3Aissue%20label%3A%22code%20change%22%20). Each issue thread includes a comment linking to the single commit or a diff across multiple commits, so those with forked repositories can easily identify what they need to patch.
