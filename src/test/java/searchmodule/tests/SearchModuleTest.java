package searchmodule.tests;

import org.testng.Assert;
import org.testng.annotations.Parameters;
import org.testng.annotations.Test;
import searchmodule.pages.SearchPage;
import tests.BaseTest;

public class SearchModuleTest extends BaseTest {

    @Test
    @Parameters({"keyword"})
    public void searchTest(String keyword) {
        SearchPage searchPage = new SearchPage(driver);
        searchPage.goTo();
        searchPage.doSearch(keyword);
        searchPage.goToVideos();
        int size = searchPage.getResult();
        Assert.assertTrue(size > 0, "Number of videos less than 0!");
    }
}

