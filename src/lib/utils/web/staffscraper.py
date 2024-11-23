import re

import requests
from bs4 import BeautifulSoup


class NameScraper:
    _instance = None

    names_set: set

    def __new__(cls):
        if cls._instance is None:
            cls._instance = super(NameScraper, cls).__new__(cls)
            cls._instance.names_set = set()
            cls._instance.bracket_pattern = re.compile(r"\s*\[.*?]")
            cls._instance._scrape_all_urls()
        return cls._instance

    def _scrape_all_urls(self):
        urls = [
            "https://wiki.pro-tanki.com/ru/%D0%A8%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD:HelpersList/Moderators",
            "https://wiki.pro-tanki.com/ru/%D0%A8%D0%B0%D0%B1%D0%BB%D0%BE%D0%BD:HelpersList/Admins"
        ]
        for url in urls:
            self.scrape_names_from_url(url)

    def scrape_names_from_url(self, web_url):
        response = requests.get(web_url)
        response.raise_for_status()

        soup = BeautifulSoup(response.text, 'html.parser')
        tables = soup.find_all("table", class_="wikitable")

        for table in tables:
            for td in table.find_all("td"):
                name = td.get_text(strip=True)
                if name and name != "—":
                    cleaned_name = self.bracket_pattern.sub("", name).strip()
                    self.names_set.add(cleaned_name)

    def get_names(self):
        return list(self.names_set)


if __name__ == "__main__":
    scraper = NameScraper()
    print(scraper.get_names())
