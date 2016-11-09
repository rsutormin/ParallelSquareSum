
package us.kbase.parallelsquaresum;

import java.util.HashMap;
import java.util.Map;
import javax.annotation.Generated;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonPropertyOrder;


/**
 * <p>Original spec-file type: CalcSquareSumRunEachOutput</p>
 * <pre>
 *  ===================== runEach =====================
 * </pre>
 * 
 */
@JsonInclude(JsonInclude.Include.NON_NULL)
@Generated("com.googlecode.jsonschema2pojo")
@JsonPropertyOrder({
    "i_squre"
})
public class CalcSquareSumRunEachOutput {

    @JsonProperty("i_squre")
    private Long iSqure;
    private Map<String, Object> additionalProperties = new HashMap<String, Object>();

    @JsonProperty("i_squre")
    public Long getISqure() {
        return iSqure;
    }

    @JsonProperty("i_squre")
    public void setISqure(Long iSqure) {
        this.iSqure = iSqure;
    }

    public CalcSquareSumRunEachOutput withISqure(Long iSqure) {
        this.iSqure = iSqure;
        return this;
    }

    @JsonAnyGetter
    public Map<String, Object> getAdditionalProperties() {
        return this.additionalProperties;
    }

    @JsonAnySetter
    public void setAdditionalProperties(String name, Object value) {
        this.additionalProperties.put(name, value);
    }

    @Override
    public String toString() {
        return ((((("CalcSquareSumRunEachOutput"+" [iSqure=")+ iSqure)+", additionalProperties=")+ additionalProperties)+"]");
    }

}
