# Sometimes it's a README fix, or something like that - which isn't relevant for
# including in a project's CHANGELOG for example
declared_trivial = github.pr_title.include? "#trivial"

# Make it more obvious that a PR is a work in progress and shouldn't be merged yet
warn("PR is classed as Work in Progress") if github.pr_title.include? "[WIP]"
warn("PR is classed as Work in Progress") if github.pr_title.include? "WIP:"

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500


if git.added_files.include? "db/migrate/*.rb"
  # git diff-index -U --cached -G corp develop
  fail "This MR adds a migration but does not update schema.rb" unless git.modified_files.include? "db/schema.rb"
  migration_files = `git grep -r "remove_column" #{gitlab.base_commit} #{gitlab.head_commit} -- db/migrate/** | cut -d ':' -f 2`.split("\n").uniq
  if migration_files.any?
    warn "This MR adds a migration which is deleting columns. Please review:  #{migration_files.join(', ')}")
  end
end

# Don't let testing shortcuts get into master by accident
fail("fdescribe left in tests") if `grep -r fdescribe specs/ `.length > 1
fail("fit left in tests") if `grep -r fit specs/ `.length > 1
