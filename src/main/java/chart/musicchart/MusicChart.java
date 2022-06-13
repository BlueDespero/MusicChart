package chart.musicchart;

import java.util.ArrayList;

public class MusicChart {
    public static ArrayList<ChartEntry> rating_list = new ArrayList<>();

    public static void add_entry(String name, String url){
        rating_list.add(new ChartEntry(name, url));
    }

    public static void vote_on_current(int rating){
        get_latest_entry().vote_on_this(rating);
    }

    public static ChartEntry get_latest_entry()
    {
        return rating_list.get(rating_list.size()-1);
    }
}
