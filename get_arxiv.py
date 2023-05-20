import arxiv

def get_arxiv_bibtex_with_abstract(arxiv_id):
    # Download the BibTeX data for the given ArXiv ID
    search = arxiv.Search(id_list=[arxiv_id])
    bib_data = next(x for x in search.results())
    # create bibtex citation in the same format as
    """
    @misc{balle2022reconstructing,
        title={Reconstructing Training Data with Informed Adversaries}, 
        author={Borja Balle and Giovanni Cherubin and Jamie Hayes},
        year={2022},
        eprint={2201.04845},
        archivePrefix={arXiv},
        primaryClass={cs.CR}
    }
    """
    # get a unique identifier from the first author's last name and year
    # e.g. balle2022
    unique_id = bib_data.authors[0].name.split(" ")[-1].lower() + str(bib_data.published.year)
    # append arxiv id to unique id
    unique_id += f"_{arxiv_id}"

    bib = f"@misc{{{unique_id},\n"

    # title
    bib += f"  title = {{{bib_data.title}}},\n"
    
    # author
    authors = bib_data.authors
    authors = [author.name for author in authors]
    authors = " and ".join(authors)
    bib += f"  author = {{{authors}}},\n"

    # year (datetime.datetime obect)
    bib += f"  year = {{{bib_data.published.year}}},\n"

    # month (datetime.datetime obect)
    bib += f"  month = {{{bib_data.published.month}}},\n"

    # url
    bib += f"  url = {{{bib_data.entry_id}}},\n"

    # abstract
    abstract = bib_data.summary
    # remove new lines
    abstract = abstract.split()
    abstract = " ".join(abstract)
    bib += f"  abstract = {{{abstract}}},\n"

    bib += f"}}\n"
    return bib

# get arxiv id from command line
import sys
arxiv_id = sys.argv[1]
bibtex_with_abstract = get_arxiv_bibtex_with_abstract(arxiv_id)
if bibtex_with_abstract:
    print(bibtex_with_abstract)
    # append to notion.bib
    with open("notion.bib", "a") as f:
        f.write(bibtex_with_abstract)
