package chart.musicchart;

public class ChartEntry {
    public float rating;
    public String url;
    public int no_votes;
    public String name;

    public ChartEntry(String name, String url) {
        this.name = name;
        this.url = url;
        this.no_votes = 0;
        this.rating = 0;
    }

    public void vote_on_this(int rating) {
        this.rating = (this.rating * this.no_votes + rating) / (this.no_votes + 1);
        this.no_votes += 1;
    }
}
