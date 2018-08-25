/* interface to show IP address for */
#define INTERFACE "re0"
/* seconds to wait between polling */
#define INTERVAL  60
/* maximum number of characters in status string */
#define MAX_LEN   128
/* output format used by printf(3) for status string */
#define OUTFMT    "ip:%s | t:%3d°C | vol:%3d%% | %s"
/* time format used by strftime(3) within status string */
#define TIMEFMT   "%a %b %d, %I:%M"
