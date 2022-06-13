package chart.musicchart;

import java.util.ArrayList;

class ChartEntry{
    public float rating;
    public String url;
    public int no_votes;
    public String name;

    public ChartEntry(String name, String url)
    {
        this.name = name;
        this.url = url;
        this.no_votes = 0;
        this.rating = 0;
    }

    public void vote_on_this(int rating)
    {
        this.rating = (this.rating*this.no_votes + rating)/(this.no_votes+1);
        this.no_votes+=1;
    }
}

public class MusicChart {
    public static ArrayList<ChartEntry> rating_list = new ArrayList<>();

    public static void add_entry(String name, String url){
        rating_list.add(new ChartEntry(name, url));
    }

    public static void vote_on_current(int rating){
        rating_list.get(rating_list.size()-1).vote_on_this(rating);
    }
}
