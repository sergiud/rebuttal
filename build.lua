module = 'rebuttal'

sourcefiledir = '.'

demofiles = {'??-*.tex'}
docfiles = {'rebuttal.tex'}
typesetfiles = {'rebuttal.dtx', '??-*.tex'}

function examples_destdir()
    return ctandir .. '/' .. module .. '/examples'
end

function typeset_example(fn)
    typesetexe = ''
    local texfn = unpackdir .. '/' .. fn

    result = runcmd(string.format("latexmk -pdf -cd '%s'", texfn))
    if not result == 0 then return result end

    local pdffn = string.gsub(fn, '.tex$', '.pdf', 1)

    local destdir = examples_destdir()
    result = mkdir(destdir)
    if not result == 0 then return result end

    result = cp(fn, unpackdir, destdir)
    if not result == 0 then return result end

    return cp(pdffn, unpackdir, destdir)
end

function typeset_demo_tasks()
    local destdir = examples_destdir()
    result = mkdir(destdir)
    if not result == 0 then return result end
    return cp('rebuttal.tex', unpackdir, destdir)
end

specialtypesetting = {}
specialtypesetting['01-scrlttr2.tex'] = {func = typeset_example}
specialtypesetting['02-article.tex'] = {func = typeset_example}

uploadconfig = {
    pkg = 'rebuttal',
    summary = 'Markup for rebuttal letters',
    description = 'The package provides means for writing structured journal and conference paper rebuttals',
    author = 'Sergiu Deitsch',
    email = 'sergiu.deitsch@gmail.com',
    ctanPath = '/macros/latex/contrib/rebuttal',
    repository = 'https://github.com/sergiud/rebuttal',
    bugtracker = 'https://github.com/sergiud/rebuttal/issues',
    update = true,
    uploader = 'Sergiu Deitsch',
    version = '0.1.0',
    topic = {'editorial', 'notes'},
    license = 'lppl1.3c',
    announcement = '',
}
